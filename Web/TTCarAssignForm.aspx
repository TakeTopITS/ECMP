<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTCarAssignForm.aspx.cs"
    Inherits="TTCarAssignForm" %>

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
            min-width: 1200px;
            width: expression (document.body.clientWidth <= 1200? "1200px" : "auto" ));
        }
    </style>
    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/allAHandler.js"></script>
    <script type="text/javascript" src="js/layer/layer/layer.js"></script>
    <script type="text/javascript" src="js/popwindow.js"></script>
    <script type="text/javascript" language="javascript">
        $(function () {
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
                                    <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td align="left">
                                                <table width="345" border="0" align="left" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td width="29">
                                                            <%--<img src="Logo/main_top_l.jpg" alt="" width="29" height="31" />--%>
                                                        </td>
                                                        <td align="center" background="ImagesSkin/main_top_bj.jpg" class="titlezi">
                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,PaiCheDan%>"></asp:Label>
                                                        </td>
                                                        <td width="5">
                                                            <%-- <img src="ImagesSkin/main_top_r.jpg" width="5" height="31" />--%>
                                                        </td>
                                                    </tr>
                                                </table>
                                                <asp:Label ID="LB_UserCode" runat="server" Visible="false"></asp:Label>
                                                <asp:Label ID="LB_UserName" runat="server" Visible="false"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" valign="top" style="padding: 5px 5px 5px 5px;">

                                    <table width="100%" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td align="right" style="padding: 0px 5px 5px 5px;">
                                                <asp:Button ID="BT_Create" runat="server" Text="<%$ Resources:lang,New%>" CssClass="inpuYello" OnClick="BT_Create_Click" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="center">
                                                <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                    <tr>
                                                        <td width="7">
                                                            <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>
                                                        <td>
                                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                <tr>
                                                                    <td width="5%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label61" runat="server" Text="<%$ Resources:lang,BianJi %>" /></strong>
                                                                    </td>
                                                                    <td width="5%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label62" runat="server" Text="<%$ Resources:lang,ShanChu %>" /></strong>
                                                                    </td>
                                                                    <td width="10%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label63" runat="server" Text="<%$ Resources:lang,FaQiShengQing%>" /></strong>
                                                                    </td>
                                                                    <td width="5%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="LB_DGProjectID" runat="server" Text="<%$ Resources:lang,DanHao %>" /></strong>
                                                                    </td>
                                                                    <td width="8%" align="center"><strong>
                                                                        <asp:Label ID="Label25" runat="server" Text="<%$ Resources:lang,ChePaiHaoMa %>"></asp:Label></strong></td>
                                                                    <td width="8%" align="center"><strong>
                                                                        <asp:Label ID="Label26" runat="server" Text="<%$ Resources:lang,SiJi %>"></asp:Label></strong></td>
                                                                    <td width="8%" align="center"><strong>
                                                                        <asp:Label ID="Label27" runat="server" Text="<%$ Resources:lang,BuMen %>"></asp:Label></strong></td>
                                                                    <td width="10%" align="center"><strong>
                                                                        <asp:Label ID="Label28" runat="server" Text="<%$ Resources:lang,ShenQingRen %>"></asp:Label></strong></td>
                                                                    <td width="10%" align="center"><strong>
                                                                        <asp:Label ID="Label29" runat="server" Text="<%$ Resources:lang,YongCheShiJian %>"></asp:Label></strong></td>
                                                                    <td width="10%" align="center"><strong>
                                                                        <asp:Label ID="Label30" runat="server" Text="<%$ Resources:lang,HuanCheShiJian %>"></asp:Label></strong></td>
                                                                    <td width="10%" align="center"><strong>
                                                                        <asp:Label ID="Label31" runat="server" Text="<%$ Resources:lang,SuiCheRen %>"></asp:Label></strong></td>
                                                                    <td width="10%" align="center"><strong>
                                                                        <asp:Label ID="Label32" runat="server" Text="<%$ Resources:lang,ShenQingYuanYin %>"></asp:Label></strong></td>
                                                                    <td align="center"><strong>
                                                                        <asp:Label ID="Label33" runat="server" Text="<%$ Resources:lang,ZhuangTai %>"></asp:Label></strong></td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                        <td width="6" align="right">
                                                            <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                                    </tr>
                                                </table>
                                                <asp:DataGrid ID="DataGrid1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                                    Height="1px" OnItemCommand="DataGrid1_ItemCommand" ShowHeader="False" PageSize="25"
                                                    OnPageIndexChanged="DataGrid1_PageIndexChanged" Width="100%" CellPadding="4"
                                                    ForeColor="#333333" GridLines="None">

                                                    <Columns>
                                                        <asp:ButtonColumn CommandName="Update" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 alt='修改' /&gt;&lt;/div&gt;">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                        </asp:ButtonColumn>
                                                        <asp:TemplateColumn HeaderText="Delete">
                                                            <ItemTemplate>
                                                                <asp:LinkButton ID="LBT_Delete" CommandName="Delete" runat="server" OnClientClick="return confirm(getDeleteMsgByLangCode())" Text="&lt;div&gt;&lt;img src=ImagesSkin/Delete.png border=0 alt='删除' /&gt;&lt;/div&gt;"></asp:LinkButton>
                                                            </ItemTemplate>
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                        </asp:TemplateColumn>
                                                        <asp:ButtonColumn ButtonType="LinkButton" CommandName="Assign" Text="&lt;div&gt;&lt;img src=ImagesSkin/Assign.png border=0 alt='删除' /&gt;&lt;/div&gt;">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                        </asp:ButtonColumn>
                                                        <asp:BoundColumn DataField="ID" HeaderText="ID">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="CarCode" HeaderText="车牌号">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                        </asp:BoundColumn>
                                                        <asp:HyperLinkColumn DataNavigateUrlField="DriverCode" DataNavigateUrlFormatString="TTUserInforSimple.aspx?UserCode={0}"
                                                            DataTextField="DriverName" HeaderText="姓名" Target="_blank">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                        </asp:HyperLinkColumn>
                                                        <asp:BoundColumn DataField="DepartName" HeaderText="部门">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                        </asp:BoundColumn>
                                                        <asp:HyperLinkColumn DataNavigateUrlField="ApplicantCode" DataNavigateUrlFormatString="TTUserInforSimple.aspx?UserCode={0}"
                                                            DataTextField="ApplicantName" HeaderText="姓名" Target="_blank">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                        </asp:HyperLinkColumn>
                                                        <asp:BoundColumn DataField="DepartTime" DataFormatString="{0:yyyy/MM/dd HH:mm}" HeaderText="用车时间">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="BackTime" DataFormatString="{0:yyyy/MM/dd HH:mm}" HeaderText="还车时间">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="Attendant" HeaderText="随车人">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="Comment" HeaderText="申请原因">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                        </asp:BoundColumn>
                                                        <asp:TemplateColumn HeaderText="状态">
                                                            <ItemTemplate>
                                                                <%# ShareClass. GetStatusHomeNameByOtherStatus(Eval("Status").ToString()) %>
                                                            </ItemTemplate>
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" />
                                                        </asp:TemplateColumn>
                                                    </Columns>
                                                    <EditItemStyle BackColor="#2461BF" />
                                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                    <ItemStyle CssClass="itemStyle" />
                                                    <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                    <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                </asp:DataGrid></td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <asp:Panel ID="Panel1" runat="server" CssClass="modalPopup" Style="display: none;">
                        <div class="modalPopup-text" style="width: 273px; height: 400px; overflow: auto;">
                            <table>
                                <tr>
                                    <td style="width: 220px; padding: 5px 5px 5px 5px;" valign="top" align="left">
                                        <asp:TreeView ID="TreeView1" runat="server" NodeWrap="True" OnSelectedNodeChanged="TreeView1_SelectedNodeChanged"
                                            ShowLines="True" Width="220px">
                                            <RootNodeStyle CssClass="rootNode" />
                                            <NodeStyle CssClass="treeNode" />
                                            <LeafNodeStyle CssClass="leafNode" />
                                            <SelectedNodeStyle CssClass="selectNode" ForeColor="Red" />
                                        </asp:TreeView>
                                    </td>
                                    <td style="width: 60px; padding: 5px 5px 5px 5px;" valign="top" align="center">
                                        <asp:ImageButton ID="IMBT_Close" ImageUrl="ImagesSkin/Close4.jpg" runat="server" />
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </asp:Panel>
                    <asp:Panel ID="Panel2" runat="server" CssClass="modalPopup" Style="display: none;">
                        <div class="modalPopup-text" style="width: 900px; height: 400px; overflow: auto;">
                            <table width="100%">
                                <tr>
                                    <td style="width: 100%; padding: 5px 5px 5px 5px;" valign="top" align="left">
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
                                                                    <asp:Label ID="Label39" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label></strong> &nbsp;
                                                            </td>
                                                            <td width="10%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="Label40" runat="server" Text="<%$ Resources:lang,YongCheBuMen%>"></asp:Label></strong> &nbsp;
                                                            </td>
                                                            <td width="10%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="Label41" runat="server" Text="<%$ Resources:lang,ShenQingRen%>"></asp:Label></strong> &nbsp;
                                                            </td>
                                                            <td width="14%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="Label42" runat="server" Text="<%$ Resources:lang,YongCheShiJian%>"></asp:Label></strong> &nbsp;
                                                            </td>
                                                            <td width="14%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="Label43" runat="server" Text="<%$ Resources:lang,HuanCheShiJian%>"></asp:Label></strong> &nbsp;
                                                            </td>
                                                            <td width="17%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="Label44" runat="server" Text="<%$ Resources:lang,SuiCheRen%>"></asp:Label></strong> &nbsp;
                                                            </td>
                                                            <td width="17%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="Label45" runat="server" Text="<%$ Resources:lang,ShenQingYuanYin%>"></asp:Label></strong> &nbsp;
                                                            </td>
                                                            <td width="10%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="Label46" runat="server" Text="<%$ Resources:lang,ShenPiZhuangTai%>"></asp:Label></strong> &nbsp;
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                                <td width="6" align="right">
                                                    <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                </td>
                                            </tr>
                                        </table>
                                        <asp:DataGrid ID="DataGrid3" runat="server" AllowPaging="False" AutoGenerateColumns="False"
                                            Height="1px" OnItemCommand="DataGrid3_ItemCommand" ShowHeader="False" Width="100%"
                                            CellPadding="4" ForeColor="#333333" GridLines="None">

                                            <Columns>
                                                <asp:TemplateColumn HeaderText="编号">
                                                    <ItemTemplate>
                                                        <asp:Button ID="BT_ID" runat="server" CssClass="inpu" Text='<%# DataBinder.Eval(Container.DataItem,"ID") %>' />
                                                    </ItemTemplate>
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                </asp:TemplateColumn>
                                                <asp:BoundColumn DataField="DepartName" HeaderText="用车部门">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="ApplicantName" HeaderText="申请人">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="DepartTime" DataFormatString="{0:yyyy/MM/dd HH:mm}" HeaderText="用车时间">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="14%" />
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="BackTime" DataFormatString="{0:yyyy/MM/dd HH:mm}" HeaderText="还车时间">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="14%" />
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="Attendant" HeaderText="随车人">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="17%" />
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="ApplyReason" HeaderText="申请原因">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="17%" />
                                                </asp:BoundColumn>
                                                <asp:TemplateColumn HeaderText="状态">
                                                    <ItemTemplate>
                                                        <%# ShareClass.GetStatusHomeNameByRequirementStatus(Eval("Status").ToString()) %>
                                                    </ItemTemplate>
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                </asp:TemplateColumn>
                                            </Columns>
                                            <EditItemStyle BackColor="#2461BF" />
                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                            <ItemStyle CssClass="itemStyle" />
                                            <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                        </asp:DataGrid>
                                    </td>
                                    <td style="width: 60px; padding: 5px 5px 5px 5px;" valign="top" align="center">
                                        <asp:ImageButton ID="IMBT_CloseApplyForm" ImageUrl="ImagesSkin/Close4.jpg" runat="server" />
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </asp:Panel>
                    <asp:Panel ID="Panel3" runat="server" CssClass="modalPopup" Style="display: none;">
                        <div class="modalPopup-text" style="width: 600px; height: 250px; overflow: auto;">
                            <table width="100%">
                                <tr>
                                    <td align="right" style="width: 20%" class="formItemBgStyle">
                                        <asp:Label ID="Label49" runat="server" Text="<%$ Resources:lang,ShiJiYongCheShiJian%>"></asp:Label>：
                                    </td>
                                    <td align="left" class="formItemBgStyle" colspan="2">
                                        <table>
                                            <tr>
                                                <td>
                                                    <asp:TextBox ID="DLC_RealDepartTime" ReadOnly="false" runat="server"></asp:TextBox>
                                                    <ajaxToolkit:CalendarExtender Format="yyyy-MM-dd" ID="CalendarExtender2"
                                                        runat="server" TargetControlID="DLC_RealDepartTime">
                                                    </ajaxToolkit:CalendarExtender>

                                                </td>
                                                <td>
                                                    <asp:DropDownList ID="DLC_RealDepartHour" runat="server" CssClass="shuru">
                                                    </asp:DropDownList>
                                                </td>
                                                <td>
                                                    <asp:Label ID="Label47" runat="server" Text="<%$ Resources:lang,Shi2%>"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:DropDownList ID="DLC_RealDepartMinute" runat="server" CssClass="shuru">
                                                    </asp:DropDownList>
                                                </td>
                                                <td>
                                                    <asp:Label ID="Label48" runat="server" Text="<%$ Resources:lang,Fen%>"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td style="width: 60px; padding: 5px 5px 5px 5px;" valign="top" align="center">
                                        <asp:ImageButton ID="IMBT_CloseAssignFormDetail" ImageUrl="ImagesSkin/Close4.jpg"
                                            runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" style="width: 15%" class="formItemBgStyle">
                                        <asp:Label ID="Label50" runat="server" Text="<%$ Resources:lang,ShiJiHuanCheShiJian%>"></asp:Label>：
                                    </td>
                                    <td colspan="2" align="left" class="formItemBgStyle">
                                        <table>
                                            <tr>
                                                <td>
                                                    <asp:TextBox ID="DLC_RealBackTime" ReadOnly="false" runat="server"></asp:TextBox>
                                                    <ajaxToolkit:CalendarExtender Format="yyyy-MM-dd" ID="CalendarExtender3"
                                                        runat="server" TargetControlID="DLC_RealBackTime">
                                                    </ajaxToolkit:CalendarExtender>
                                                </td>
                                                <td>
                                                    <asp:DropDownList ID="DLC_RealBackHour" runat="server" CssClass="shuru">
                                                    </asp:DropDownList>
                                                </td>
                                                <td>
                                                    <asp:Label ID="Label52" runat="server" Text="<%$ Resources:lang,Shi2%>"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:DropDownList ID="DLC_RealBackMinute" runat="server" CssClass="shuru">
                                                    </asp:DropDownList>
                                                </td>
                                                <td>
                                                    <asp:Label ID="Label51" runat="server" Text="<%$ Resources:lang,Fen%>"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" class="formItemBgStyle" style="">
                                        <asp:Label ID="Label53" runat="server" Text="<%$ Resources:lang,ZongLiCheng%>"></asp:Label>：
                                    </td>
                                    <td colspan="2" align="left" class="formItemBgStyle">
                                        <table>
                                            <tr>
                                                <td>
                                                    <NickLee:NumberBox MaxAmount="1000000000000" MinAmount="-1000000000000" ID="NB_Mileage" runat="server" Width="80px">0.00</NickLee:NumberBox>
                                                </td>
                                                <td>&nbsp;
                                                    <asp:Label ID="Label54" runat="server" Text="<%$ Resources:lang,GuoLuFei%>"></asp:Label>：
                                                </td>
                                                <td>
                                                    <NickLee:NumberBox MaxAmount="1000000000000" MinAmount="-1000000000000" ID="NB_RoadToll" runat="server" Width="80px">0.00</NickLee:NumberBox>
                                                </td>
                                                <td>&nbsp;<asp:Label ID="Label55" runat="server" Text="<%$ Resources:lang,TingCheFei%>"></asp:Label>：
                                                </td>
                                                <td>
                                                    <NickLee:NumberBox MaxAmount="1000000000000" MinAmount="-1000000000000" ID="NB_ParkingCharge" runat="server" Width="80px">0.00</NickLee:NumberBox>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" class="formItemBgStyle" style="">
                                        <asp:Label ID="Label56" runat="server" Text="<%$ Resources:lang,JiaYou%>"></asp:Label>：
                                    </td>
                                    <td colspan="2" align="left" class="formItemBgStyle">
                                        <table>
                                            <tr>
                                                <td>
                                                    <NickLee:NumberBox MaxAmount="1000000000000" MinAmount="-1000000000000" ID="NB_OilVolume" runat="server" Width="80px">0.00</NickLee:NumberBox>
                                                </td>
                                                <td>&nbsp;
                                                    <asp:Label ID="Label57" runat="server" Text="<%$ Resources:lang,JiaYouFei%>"></asp:Label>：
                                                </td>
                                                <td>
                                                    <NickLee:NumberBox MaxAmount="1000000000000" MinAmount="-1000000000000" ID="NB_OilCharge" runat="server" Width="80px">0.00</NickLee:NumberBox>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="3" align="center" class="formItemBgStyle">
                                        <asp:Button ID="BT_UpdateDetail" CssClass="inpu" runat="server" Text="<%$ Resources:lang,BaoCun%>" OnClick="BT_UpdateDetail_Click" />
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </asp:Panel>



                    <div class="layui-layer layui-layer-iframe" id="popwindow"
                        style="z-index: 9999; width: 900px; height: 530px; position: absolute; overflow: hidden; display: none; border-radius: 10px;">
                        <div class="layui-layer-title" style="background: #e7e7e8;" id="popwindow_title">
                            <asp:Label ID="Label59" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 width=30px height=30px alt='BusinessForm' /&gt;&lt;/div&gt;"></asp:Label>
                        </div>
                        <div id="popwindow_content" class="layui-layer-content" style="overflow: auto; padding: 0px 5px 0px 5px;">
                            <table style="width: 110%;" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td valign="top" style="width: 65%; padding: 10px 5px 5px 5px; border-right: solid 1px #D8D8D8; border-bottom: solid 1px #D8D8D8;">
                                        <table class="formBgStyle" style="width: 100%;" cellpadding="3" cellspacing="0">
                                            <tr>
                                                <td align="right" style="width: 15%" class="formItemBgStyle">
                                                    <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,ShenQingDanHao%>"></asp:Label>：
                                                </td>
                                                <td align="left" style="width: 35%" class="formItemBgStyle">
                                                    <NickLee:NumberBox MaxAmount="1000000000000" MinAmount="-1000000000000" ID="NB_ApplyFormID" runat="server" Precision="0" Width="60px">0</NickLee:NumberBox>
                                                    <asp:Button ID="BT_Select" runat="server" Text="<%$ Resources:lang,XuanZe%>" />
                                                    <cc1:ModalPopupExtender ID="TB_Select_ModalPopupExtender" runat="server" BackgroundCssClass="modalBackground" Y="150"
                                                        CancelControlID="IMBT_CloseApplyForm" Enabled="True" PopupControlID="Panel2"
                                                        TargetControlID="BT_Select">
                                                    </cc1:ModalPopupExtender>
                                                </td>
                                                <td align="right" class="formItemBgStyle" style="width: 15%">
                                                    <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,PaiCheDanHao%>"></asp:Label>：
                                                </td>
                                                <td align="left" class="formItemBgStyle">
                                                    <asp:Label ID="LB_ID" runat="server"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" class="formItemBgStyle">
                                                    <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,ChePaiHaoMa%>"></asp:Label>：
                                                </td>
                                                <td align="left" class="formItemBgStyle" colspan="3">
                                                    <asp:DropDownList ID="DL_CarCode" runat="server" DataTextField="CarCode" DataValueField="CarCode">
                                                    </asp:DropDownList>
                                                    &nbsp;<asp:HyperLink ID="HL_CarStatus" runat="server" Font-Size="10pt" NavigateUrl="TTCarStatus.aspx"
                                                        Target="_blank">
                                                        <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,ChaKanCheLiangZhuangTai%>"></asp:Label>
                                                    </asp:HyperLink>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" class="formItemBgStyle">
                                                    <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,ShenQingRen%>"></asp:Label>：
                                                </td>
                                                <td align="left" class="formItemBgStyle">
                                                    <asp:Label ID="LB_ApplicantCode" runat="server"></asp:Label>
                                                    &nbsp;<asp:Label ID="LB_ApplicantName" runat="server"></asp:Label>
                                                    &nbsp;&nbsp; (--&gt;<asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,KeYiCongYouBianXuanQu%>"></asp:Label>）
                                                </td>
                                                <td align="right" class="formItemBgStyle">
                                                    <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,YongCheBuMen%>"></asp:Label>：
                                                </td>
                                                <td align="left" class="formItemBgStyle">
                                                    <asp:TextBox ID="TB_DepartCode" Width="80px" runat="server"></asp:TextBox>&nbsp;
                                                        <asp:Label ID="LB_DepartName" runat="server"></asp:Label>
                                                    <cc1:ModalPopupExtender ID="TB_DepartCode_ModalPopupExtender" runat="server" Enabled="True"
                                                        TargetControlID="TB_DepartCode" PopupControlID="Panel1" CancelControlID="IMBT_Close"
                                                        BackgroundCssClass="modalBackground" Y="150">
                                                    </cc1:ModalPopupExtender>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" class="formItemBgStyle">
                                                    <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,JiHuaYongCheShiJian%>"></asp:Label>：
                                                </td>
                                                <td align="left" class="formItemBgStyle" colspan="3">
                                                    <table>
                                                        <tr>
                                                            <td>
                                                                <asp:TextBox ID="DLC_DepartTime" ReadOnly="false" runat="server"></asp:TextBox>
                                                                <ajaxToolkit:CalendarExtender Format="yyyy-MM-dd" ID="CalendarExtender1" runat="server" TargetControlID="DLC_DepartTime">
                                                                </ajaxToolkit:CalendarExtender>
                                                            </td>
                                                            <td>
                                                                <asp:DropDownList ID="DLC_DepartBeginHour" runat="server" CssClass="shuru">
                                                                </asp:DropDownList>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,Shi2%>"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:DropDownList ID="DLC_DepartBeginMinute" runat="server" CssClass="shuru">
                                                                </asp:DropDownList>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,Fen%>"></asp:Label>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" class="formItemBgStyle">
                                                    <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,JiHuaHuanCheShiJian%>"></asp:Label>：
                                                </td>
                                                <td align="left" class="formItemBgStyle" colspan="3">
                                                    <table>
                                                        <tr>
                                                            <td>
                                                                <asp:TextBox ID="DLC_BackTime" ReadOnly="false" runat="server"></asp:TextBox>
                                                                <ajaxToolkit:CalendarExtender Format="yyyy-MM-dd" ID="CalendarExtender4"
                                                                    runat="server" TargetControlID="DLC_BackTime">
                                                                </ajaxToolkit:CalendarExtender>
                                                            </td>
                                                            <td>
                                                                <asp:DropDownList ID="DLC_BackBeginHour" runat="server" CssClass="shuru">
                                                                </asp:DropDownList>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,Shi2%>"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:DropDownList ID="DLC_BackBeginMinute" runat="server" CssClass="shuru">
                                                                </asp:DropDownList>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,Fen%>"></asp:Label>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" class="formItemBgStyle">
                                                    <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,SiJi%>"></asp:Label>：
                                                </td>
                                                <td align="left" class="formItemBgStyle">
                                                    <asp:DropDownList ID="DL_Driver" runat="server" DataTextField="UserName"
                                                        DataValueField="UserCode">
                                                    </asp:DropDownList>
                                                </td>
                                                <td align="right" class="formItemBgStyle">
                                                    <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,MenWei%>"></asp:Label>：
                                                </td>
                                                <td align="left" class="formItemBgStyle">
                                                    <asp:DropDownList ID="DL_Guard" runat="server" DataTextField="UserName" DataValueField="UserCode">
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" class="formItemBgStyle">
                                                    <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,SuiCheRen%>"></asp:Label>：
                                                </td>
                                                <td align="left" class="formItemBgStyle" colspan="3">
                                                    <asp:TextBox ID="TB_Attendant" runat="server" Width="90%"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" class="formItemBgStyle">
                                                    <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,ShangCheDiDian%>"></asp:Label>：
                                                </td>
                                                <td align="left" class="formItemBgStyle">
                                                    <asp:TextBox ID="TB_BoardingSite" runat="server" Width="90%"></asp:TextBox>
                                                </td>
                                                <td align="right" class="formItemBgStyle">
                                                    <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,MuDiDi%>"></asp:Label>：
                                                </td>
                                                <td align="left" class="formItemBgStyle">
                                                    <asp:TextBox ID="TB_Destination" runat="server" Width="90%"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" style="height: 30px" class="formItemBgStyle">
                                                    <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,ShiYou%>"></asp:Label>：
                                                </td>
                                                <td align="left" style="height: 30px" class="formItemBgStyle" colspan="3">
                                                    <asp:TextBox ID="TB_Comment" runat="server" Height="70px" TextMode="MultiLine" Width="90%"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" style="height: 6px" class="formItemBgStyle">
                                                    <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label>：
                                                </td>
                                                <td align="left" style="height: 6px" class="formItemBgStyle">
                                                    <asp:DropDownList ID="DL_Status" runat="server" OnSelectedIndexChanged="DL_Status_SelectedIndexChanged"
                                                        AutoPostBack="True">
                                                        <asp:ListItem Value="新建" Text="<%$ Resources:lang,XinJian%>" />
                                                        <asp:ListItem Value="出车" Text="<%$ Resources:lang,ChuChe%>" />
                                                        <asp:ListItem Value="收车" Text="<%$ Resources:lang,ShouChe%>" />
                                                        <asp:ListItem Value="关闭" Text="<%$ Resources:lang,GuanBi%>" />
                                                        <asp:ListItem Value="取消" Text="<%$ Resources:lang,QuXiao%>" />
                                                    </asp:DropDownList>
                                                </td>
                                                <td align="left" class="formItemBgStyle" style="height: 6px">&nbsp;
                                                </td>
                                                <td align="left" class="formItemBgStyle" style="height: 6px">&nbsp;
                                                        <asp:Label ID="LB_Sql" runat="server" Visible="false"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" class="formItemBgStyle"></td>
                                                <td align="left" class="formItemBgStyle">
                                                    <asp:Button ID="BT_CarAssignFormDetail" Enabled="false" runat="server" Text="<%$ Resources:lang,ShiJiShiJianHeFeiYong%>" />
                                                    <cc1:ModalPopupExtender ID="BT_CarAssignFormDetail_ModalPopupExtender" runat="server"
                                                        BackgroundCssClass="modalBackground" Y="150" CancelControlID="IMBT_CloseAssignFormDetail"
                                                        Enabled="True" PopupControlID="Panel3" TargetControlID="BT_CarAssignFormDetail">
                                                    </cc1:ModalPopupExtender>
                                                    &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
                                                        <asp:HyperLink ID="HL_PringAssignForm" runat="server" Target="_blank">打印</asp:HyperLink>

                                                </td>
                                                <td align="left" class="formItemBgStyle" colspan="2"></td>
                                            </tr>
                                            <tr>
                                                <td align="left" class="formItemBgStyle" colspan="4">
                                                    <asp:CheckBox ID="CB_SendMsg" runat="server" Text="<%$ Resources:lang,FaXinXi%>" />
                                                    <asp:CheckBox ID="CB_SendMail" runat="server" Text="<%$ Resources:lang,FaYouJian%>" />
                                                    &nbsp;<asp:Label ID="Label22" runat="server" Text="<%$ Resources:lang,TongZhiSiJi%>"></asp:Label>&nbsp;&nbsp;<asp:TextBox ID="TB_Message" runat="server" Width="50%"></asp:TextBox>
                                                    &nbsp;<asp:Button ID="BT_Send" runat="server" CssClass="inpu" OnClick="BT_Send_Click"
                                                        Text="<%$ Resources:lang,FaSong%>" />
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td valign="top" style="width: 35%; padding: 10px 5px 5px 5px; border-bottom: solid 1px #D8D8D8;">
                                        <div id="mess_box" style="width: 100%; height: 410px; overflow: auto;">
                                            <table class="formBgStyle" style="width: 100%;" cellpadding="3" cellspacing="0">
                                                <tr>
                                                    <td class="formItemBgStyle" style="width: 175px; padding: 5px 5px 5px 5px; text-align: center; vertical-align: top;">
                                                        <table class="formBgStyle" width="100%" border="0" cellpadding="0" cellspacing="0"
                                                            background="ImagesSkin/main_n_bj.jpg">
                                                            <tr>
                                                                <td width="7">
                                                                    <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                                </td>
                                                                <td>
                                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                        <tr>
                                                                            <td width="100%" align="center">
                                                                                <strong>
                                                                                    <asp:Label ID="Label23" runat="server" Text="<%$ Resources:lang,BuMenRenYuan%>"></asp:Label></strong>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                                <td width="6" align="right">
                                                                    <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                                </td>
                                                            </tr>
                                                        </table>
                                                        <asp:DataGrid ID="DataGrid2" runat="server" AutoGenerateColumns="False" OnItemCommand="DataGrid2_ItemCommand"
                                                            Width="100%" CellPadding="4" ForeColor="#333333" GridLines="None" ShowHeader="false"
                                                            Font-Bold="True">
                                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                            <EditItemStyle BackColor="#2461BF" />
                                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />

                                                            <ItemStyle CssClass="itemStyle" />
                                                            <Columns>
                                                                <asp:TemplateColumn HeaderText="">
                                                                    <ItemTemplate>
                                                                        <asp:Button ID="BT_UserCode" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"UserCode") %>'
                                                                            CssClass="inpu" />
                                                                        <asp:Button ID="BT_UserName" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"UserName") %>'
                                                                            CssClass="inpu" />
                                                                    </ItemTemplate>
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                                </asp:TemplateColumn>
                                                            </Columns>
                                                            <HeaderStyle BackColor="#507CD1" Font-Bold="True" HorizontalAlign="Left" ForeColor="White" />
                                                        </asp:DataGrid>
                                                    </td>
                                                    <td class="formItemBgStyle" style="padding: 5px 5px 5px 5px;" valign="top"
                                                        align="left">
                                                        <asp:TreeView ID="TreeView2" runat="server" BorderColor="Transparent" NodeWrap="True"
                                                            OnSelectedNodeChanged="TreeView2_SelectedNodeChanged" ShowLines="True" Width="190px">
                                                            <RootNodeStyle CssClass="rootNode" />
                                                            <NodeStyle CssClass="treeNode" />
                                                            <LeafNodeStyle CssClass="leafNode" />
                                                            <SelectedNodeStyle CssClass="selectNode" ForeColor="Red" />
                                                        </asp:TreeView>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </td>
                                </tr>
                            </table>

                        </div>

                        <div id="popwindow_footer" class="layui-layer-btn" style="border-top: 1px solid #ccc;">
                            <asp:LinkButton ID="BT_New" runat="server" class="layui-layer-btn notTab" OnClick="BT_New_Click" Text="<%$ Resources:lang,BaoCun%>"></asp:LinkButton><a class="layui-layer-btn notTab" onclick="return popClose();"><asp:Label ID="Label60" runat="server" Text="<%$ Resources:lang,GuanBi%>" /></a>
                        </div>
                        <span class="layui-layer-setwin"><a onclick="return popClose();" class="layui-layer-ico layui-layer-close layui-layer-close1 notTab" href="javascript:;"></a></span>
                    </div>


                    <div class="layui-layer layui-layer-iframe" id="popWFApplyWindow" name="noConfirm"
                        style="z-index: 9999; width: 900px; height: 530px; position: absolute; overflow: hidden; display: none; border-radius: 10px;">
                        <div class="layui-layer-title" style="background: #e7e7e8;" id="popwindow_title1">
                            <asp:Label ID="Label24" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 width=30px height=30px alt='BusinessForm' /&gt;&lt;/div&gt;"></asp:Label>
                        </div>
                        <div id="popwindow_content1" class="layui-layer-content" style="overflow: auto; padding: 0px 5px 0px 5px;">

                            <table width="90%" cellpadding="4" cellspacing="0">
                                <tr>
                                    <td align="center" style="height: 22px; text-align: left;">
                                        <asp:Label ID="Label34" runat="server" Text="<%$ Resources:lang,DuiYingGongZuoLiuLieBiao%>"></asp:Label>：&#160; </td>
                                </tr>
                                <tr>
                                    <td align="left">
                                        <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                            <tr>
                                                <td width="7">
                                                    <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>
                                                <td>
                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                        <tr>
                                                            <td width="10%" align="center"><strong>
                                                                <asp:Label ID="Label35" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label></strong></td>
                                                            <td width="50%" align="center"><strong>
                                                                <asp:Label ID="Label36" runat="server" Text="<%$ Resources:lang,GongZuoLiu%>"></asp:Label></strong></td>
                                                            <td width="20%" align="center"><strong>
                                                                <asp:Label ID="Label37" runat="server" Text="<%$ Resources:lang,ShenQingShiJian%>"></asp:Label></strong></td>
                                                            <td width="10%" align="center"><strong>
                                                                <asp:Label ID="Label38" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label></strong></td>
                                                            <td width="10%" align="center"><strong></strong></td>
                                                        </tr>
                                                    </table>
                                                </td>
                                                <td width="6" align="right">
                                                    <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
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
                                                <asp:HyperLinkColumn DataNavigateUrlField="WLID" DataNavigateUrlFormatString="TTWorkFlowViewMain.aspx?WLID={0}"
                                                    DataTextField="WLName" HeaderText="工作流" Target="_blank">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="50%" />
                                                </asp:HyperLinkColumn>
                                                <asp:BoundColumn DataField="CreateTime" HeaderText="申请时间">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%" />
                                                </asp:BoundColumn>
                                                <asp:TemplateColumn HeaderText="状态">
                                                    <ItemTemplate>
                                                        <%# ShareClass. GetStatusHomeNameByOtherStatus(Eval("Status").ToString()) %>
                                                    </ItemTemplate>
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                </asp:TemplateColumn>
                                                <asp:TemplateColumn>
                                                    <ItemTemplate>
                                                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# DataBinder.Eval(Container, "DataItem.WLID", "TTWLRelatedDoc.aspx?DocType=WorkFlow&WLID={0}") %>'
                                                            Target="_blank"><img src="ImagesSkin/Doc.gif" class="noBorder"/></asp:HyperLink>
                                                    </ItemTemplate>
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                </asp:TemplateColumn>
                                            </Columns>
                                        </asp:DataGrid>

                                    </td>
                                </tr>
                            </table>

                        </div>

                        <div id="popwindow_footer1" class="layui-layer-btn" style="border-top: 1px solid #ccc;">
                            <a class="layui-layer-btn notTab" onclick="return popClose();">
                                <asp:Label ID="Label58" runat="server" Text="<%$ Resources:lang,GuanBi%>" /></a>
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
